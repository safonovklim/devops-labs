# Use the official nginx image as a base
FROM nginx:latest

# Copy the devops.html file into the container
COPY devops.html /usr/share/nginx/html/

# Expose port 80 for serving content
EXPOSE 80

# Run nginx -g 'daemon off;'

# Open the default Nginx port to allow access from outside the container
CMD ["nginx", "-g", "daemon off;"]
