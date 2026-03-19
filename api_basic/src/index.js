/**
*Author: 	DIEGO CASALLAS
*Date:		01/01/2026  
*Description:	Index file for the API - NODEJS
**/
import app from './app/app.js';
import dotenv from 'dotenv';
import { appLogger } from './library/appLogger.js';

dotenv.config({path:'../env'});
const PORT = process.env.PORT || 3000; // Allow dynamic port configuration

// Start the server
app.listen(PORT, () => {
  appLogger.success(`Server running on port ${PORT}`);
});
