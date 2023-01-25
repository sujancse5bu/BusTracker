import User from "../models/User.js"
import jwt from 'jsonwebtoken'

export const authUser = async (req, res) => {
  const { email, password } = req.body
  try {
    const user = await User.findOne({ email })
    if (user && (await user.matchPassword(password))) {
      return res.json({
        success: true,
        user: {
          _id: user._id,
          name: user.name,
          email: user.email,
          isAdmin: user.isAdmin,
          token: jwt.sign({ id: user._id }, process.env.JWT_SECRET, { expiresIn: "10d" }),
        },
      })
    } else {
      res
        .status(401)
        .json({ success: false, message: "Email ro passowrd doesn't match!" })
    }
  } catch (error) {
    return res.status(500).json({ success: false, error })
  }
}

export const registerUser = async (req, res) => {
  const { name, email, password } = req.body

  const userExists = await User.findOne({ email })
  try {
    if (userExists) {
      console.log('user exists: ', userExists)
      return res.status(400).json({
        success: false,
        message: "User Already Exists",
      })
    }
    const user = await User.create({
      name,
      email,
      password,
    })
    if (user) {
      console.log('created user: ', user)
      return res.status(201).json({
        success: true,
        user: {
          _id: user._id,
          name: user.name,
          email: user.email,
          isAdmin: user.isAdmin,
          token: jwt.sign({ id: user._id }, process.env.JWT_SECRET, { expiresIn: "10d" }),
        },
      })
    } else {
      return res.status(400).json({ success: false, message: "Invalid User Data" })
    }
  } catch (error) {
    return res.status(500).json({ success: false, error })
  }
}
