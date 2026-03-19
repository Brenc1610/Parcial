/**
*Author: 	DIEGO CASALLAS
*Date:		01/01/2026  
*Description:	Application setup for the API - NODEJS
**/
import express from 'express';
import cors from 'cors';
import userRoutes from '../routes/user.routes.js';
import userStatusRoutes from '../routes/userStatus.routes.js';
import roleRoutes from '../routes/role.routes.js';
import userApiRoutes from '../routes/apiUser.routes.js';
import morgan from 'morgan';

// Create an instance of the Express application
const app = express();
// Define the base path for the API
const NAME_API = '/api_v1';
// Middleware to handle JSON
app.use(express.json());

// Middleware to allow cross-origin requests (needed for Flutter web / browsers)
app.use(cors());

// Middleware for logging HTTP requests
app.use(morgan('dev'));

// Routes for the API
app.use(NAME_API, userRoutes);
app.use(NAME_API, userStatusRoutes);
app.use(NAME_API, roleRoutes);
app.use(NAME_API, userApiRoutes);

// Handle 404 errors for undefined routes
app.use((req, res, next) => {
  res.status(404).json({
    message: 'Endpoint losses 404, not found'
  });
});

export default app;