# Etapa 1: Construcción
FROM node:18-alpine AS build

WORKDIR /app

# Copia solo los archivos necesarios para instalar dependencias
COPY Minas-frontend-react/package.json Minas-frontend-react/package-lock.json* ./

RUN npm install

# Copia el resto del código de la aplicación
COPY Minas-frontend-react/ ./

# Construye la aplicación
RUN npm run build

# Etapa 2: Producción con nginx
FROM nginx:alpine

# Borra la configuración por defecto de nginx (opcional)
RUN rm -rf /usr/share/nginx/html/*

# Copia el build de Vite
COPY --from=build /app/dist /usr/share/nginx/html

# (Opcional) Copia configuración personalizada de nginx
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
