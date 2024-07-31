import { Router } from 'express'
import * as controller from '../controllers/usuarios.js'
import { authMiddleware, authMiddlewareAdmin } from '../middleware/middleware_verify.js'
import { userValidator } from '../middleware/user_validator.js'

const router = Router()
router.route('/usuario')
  .get(authMiddleware, controller.getDatosCredencial)
  .post(userValidator, controller.getCredenciales)
  .put(controller.putInforme)
router.route('/admin')
  .get(authMiddlewareAdmin, controller.getDatosCredencial)
  .post(userValidator, controller.getAdmin)
  .put(controller.putInforme)
router.route('/usergoogle')
  .post(controller.getCredencialesGoogle)
router.route('/informes')
  .get(controller.getInforme)
  .put(authMiddlewareAdmin, controller.putProrroga)
  .delete(authMiddlewareAdmin, controller.deleteNna)

export default router
