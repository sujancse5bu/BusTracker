import express from "express";
import mongoose from "mongoose";
import path from "path";

//Security middleware import
import rateLimit from "express-rate-limit"
import helmet from "helmet"
import mongoSanitize  from "express-mongo-sanitize";
import xss from "xss-clean"
import hpp from "hpp"
import bodyParser from "body-parser"
import dotenv from "dotenv"

// Routers




dotenv.config()

const app = express();
// global.__basedir = __dirname;


//security middleware implement
app.use(helmet());
app.use(helmet.crossOriginResourcePolicy({ policy: "cross-origin" }))
app.use(mongoSanitize());
app.use(xss());
app.use(hpp());
// app.use(express.static(path.join(__dirname, "uploads")));
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

// parse application/json
app.use(bodyParser.json());

//Request rate-limiting
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
});
app.use(limiter);

// Database connections
const options = { user: "", pass: "", autoIndex: false };
const MONGO_URL = process.env.NODE_ENV === 'DEV'
  ? process.env.MONGO_URL_LOCAL : process.env.NODE_ENV === 'PROD'
    ? process.env.MONGO_URL_CLUSTER : ''

console.log('Mongo URL: ', MONGO_URL)
mongoose.connect(MONGO_URL, options, (err) => {
  if (!err) {
    console.log("DB connection success");

    console.log("Server Running at port ", process.env.PORT);
    console.log("--------------------------------------------------\n\n\n");
  } else {
    console.log("Db connection fails!");
  }
});

//Handling CORS
app.use((req, res, next) => {
  const devUrls = ["*"]
  const prodUrls = []
  const allowedOrigins =
    process.env.NODE_ENV === 'DEV' ? devUrls
      : process.env.NODE_ENV === 'PROD' ? prodUrls
        : []

  const origin = req.headers.origin || "";
  if (allowedOrigins.includes(origin)) {
    res.setHeader("Access-Control-Allow-Origin", origin);
  }
  res.header("Access-Control-Allow-Methods", "GET, PUT, DELETE, OPTIONS");
  res.header("Access-Control-Allow-Headers", "Content-Type, Authorization");
  res.header("Access-Control-Allow-Credentials", "true");

  if (req.method === "OPTIONS") {
    return res.status(200).end();
  }

  return next();
});




// app.use("/api/user", userRouter)

app.use("*", (req, res) => {
  res.status(404).json({ status: "Fail", data: "URL Not Found !" });
});

export default app
