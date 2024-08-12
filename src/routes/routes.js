import { Router } from 'express'
import * as controller from '../controllers/usuarios.js'
import { authMiddleware, authMiddlewareAdmin } from '../middleware/middleware_verify.js'

const router = Router()
router.route('/usuario')
  .get(authMiddleware, controller.getDatosCredencial)
  .put(controller.putInforme)
router.route('/admin')
  .get(authMiddlewareAdmin, controller.getDatosCredencial)
  .put(controller.putInforme)
router.route('/usergoogle')
  .post(controller.getCredencialesGoogle)
router.route('/informes')
  .get(authMiddleware, controller.getInforme)
  .put(authMiddlewareAdmin, controller.putProrroga)
  .delete(authMiddlewareAdmin, controller.deleteNna)

export default router
