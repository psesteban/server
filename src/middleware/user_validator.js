export const userValidator = (req, res, next) => {
  const { name, password } = req.body
  if (!name || !password) {
    return res.status(400).json({ error: 'Faltan nombre y/o password' })
  }
  next()
}
