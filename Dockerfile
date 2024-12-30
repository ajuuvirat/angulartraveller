# Step 1: Use a smaller base Node.js image for building the Angular app
FROM node:16-slim AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json first to install dependencies
COPY package*.json ./

# Step 4: Install all dependencies (including devDependencies)
RUN npm install --legacy-peer-deps

# Debugging step: Verify if Angular CLI is installed correctly
RUN npx ng version

# Step 5: Copy the rest of the application files into the container
COPY . .

# Step 6: Build the Angular app using the development configuration
RUN npm run build -- --configuration=development

# Debugging step: Check for build output or errors
RUN ls -R /app/dist

# Step 7: Create a lightweight Nginx image to serve the Angular app
FROM nginx:alpine AS production

# Step 8: Use the default Nginx configuration without needing nginx.conf in your project directory
# Nginx's default config should work well for Angular apps, serving static files and routing requests to index.html

# Step 9: Copy the built Angular app from the build stage into Nginx's serving directory
COPY --from=build /app/dist/ccGuestApp /usr/share/nginx/html

# Step 10: Expose the port Nginx will use
EXPOSE 80

# Step 11: Run Nginx in the foreground (default command)
CMD ["nginx", "-g", "daemon off;"]
