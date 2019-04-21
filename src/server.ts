import Koa from 'koa'
import { postgraphile as createPostgaphileMiddleware } from 'postgraphile'
import { IncomingMessage } from 'http' // eslint-disable-line

const log = (...args: any[]) => console.log('[super-commerce]', ...args)

async function start () {
  const app = new Koa()
  app.use(
    createPostgaphileMiddleware(
      'postgres://commerce@localhost:5432/postgres',
      'public',
      {
        graphiql: true,
        pgSettings: async req => {
          const { userId, isAdmin } = await getUser(req)
          return {
            'commerce.is_admin': isAdmin,
            'commerce.user_id': userId
          }
        }
      }
    )
  )
  app.listen(3000)
  log('server listening on 3000')
  log('visit http://localhost:3000/graphiql to play')
}

const getUser = async (req: IncomingMessage) => {
  // in a real app, you'd probably have an auth middleware,
  // which may do something like:
  // const userId = await authClient.decodeValidatedUserId(
  //     jwt: req.headers.jwt
  // })

  // @warning - *never actually do this!*
  // for simplicty sake--let's pretend that the
  // authorized user_id is in the cookie.
  // 1 c-bear, 2 jamal, 3 jessica, 4 chaz
  const cookie = req.headers.cookie || ''
  const userId = cookie.match(/user_id=(\d+)/i)
    ? parseInt(cookie.match(/user_id=(\d+)/i)![1], 10)
    : 0
  return {
    isAdmin: !!cookie.match(/is_admin/i),
    userId
  }
}

start()
