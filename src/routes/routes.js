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
router.route('/formatos')
  .get(authMiddlewareAdmin, controller.getInforme)
router.route('/tablas')
  .get(authMiddlewareAdmin, controller.getListas)
  .put(authMiddlewareAdmin, controller.putLista)
router.route('/nna')
  .get(authMiddlewareAdmin, controller.getNna)
  .post(authMiddlewareAdmin, controller.postNna)
  .put(authMiddlewareAdmin, controller.putNna)
router.route('/adulto')
  .put(authMiddlewareAdmin, controller.putAdulto)
router.route('/profesional')
  .get(authMiddleware, controller.getPro)
  .post(authMiddlewareAdmin, controller.postTarea)
  .put(authMiddlewareAdmin, controller.putUrgent)

router.route('/resumen')
  .post(authMiddlewareAdmin, controller.postResumen)

export default router
