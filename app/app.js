const express = require('express');
const cors = require('cors');
// eslint-disable-next-line import/no-extraneous-dependencies
const expressJSDocSwagger = require('express-jsdoc-swagger');
const errorMiddleware = require('./middlewares/error.middleware');
const routerApi = require('./routers/api.router');

const options = {
  info: {
    version: '1.0.0',
    title: 'Monster Hunter Builder API',
    description: 'API MH',
  },
  // Base directory which we use to locate your JSDOC files
  baseDir: __dirname,
  // Glob pattern to find your jsdoc files (multiple patterns can be added in an array)
  filesPattern: './**/*.js',
  // URL where SwaggerUI will be rendered
  swaggerUIPath: '/api-docs',
  // Expose OpenAPI UI
  exposeSwaggerUI: true,
  // Expose Open API JSON Docs documentation in `apiDocsPath` path.
  exposeApiDocs: false,
  // Open API JSON Docs endpoint.
  apiDocsPath: '/v3/api-docs',
  // Set non-required fields as nullable by default
  notRequiredAsNullable: false,
  // You can customize your UI options.
  // you can extend swagger-ui-express config. You can checkout an example of this
  // in the `example/configuration/swaggerOptions.js`
  swaggerUiOptions: {},
  // multiple option in case you want more that one instance
  multiple: true,
};

const app = express();

expressJSDocSwagger(app)(options);
app.use(cors());
app.use(express.json());
app.use(errorMiddleware.errorMiddleware);
app.use(routerApi);

module.exports = app;
