import { Router } from 'express'
import * as controller from '../controllers/usuarios.js'
import { authMiddleware, authMiddlewareAdmin } from '../middleware/middleware_verify.js'

const router = Router()
router.route('/usuario')
  .get(authMiddleware, controller.getDatosCredencial)
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
  .get(authMiddlewareAdmin, controller.getProfesionales)
  .post(authMiddlewareAdmin, controller.postAdulto)
  .put(authMiddlewareAdmin, controller.putAdulto)
router.route('/profesional')
  .get(authMiddleware, controller.getPro)
  .post(authMiddlewareAdmin, controller.postTarea)
router.route('/resumen')
  .put(authMiddlewareAdmin, controller.putResumen)
router.route('/dato')
  .get(authMiddlewareAdmin, controller.logros)
  .put(authMiddlewareAdmin, controller.putDato)
router.route('/logros')
  .get(authMiddleware, controller.getLogro)
  .post(authMiddlewareAdmin, controller.postLogro)
  .delete(authMiddlewareAdmin, controller.deleteLogro)
router.route('/atrasos')
  .get(controller.getAtrasos)
router.route('/tareas')
  .get(authMiddleware, controller.getTareas)
  .put(authMiddleware, controller.putTarea)
router.route('/task')
  .get(authMiddlewareAdmin, controller.getTodasTareas)
  .post(authMiddlewareAdmin, controller.posTarea)
  .put(authMiddlewareAdmin, controller.putTarea)
  .delete(authMiddlewareAdmin, controller.deleteTarea)

export default router
