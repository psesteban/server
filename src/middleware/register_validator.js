export const registerValidator = (req, res, next) => {
  const { email, password, rol, lenguage } = req.body
  if (!email || !password || !rol || !lenguage) {
    return res.status(400).json({ error: 'se requiere el email, password, rol y/o lenguaje' })
  }
  next()
}
