# Usa Ubuntu como base
FROM ubuntu:22.04

# Instala dependencias necesarias para Minecraft Bedrock
RUN apt update && \
    apt install -y libcurl4 libssl3 libstdc++6 libgcc-s1 tzdata

# Establece directorio de trabajo
WORKDIR /bedrock

# Copia el contenido del servidor ya descomprimido
COPY server_data/ /bedrock/

# Da permisos de ejecución
RUN chmod +x /bedrock/bedrock_server

# Expone el puerto UDP de Bedrock
EXPOSE 19132/udp

# Ejecuta el servidor
CMD ["./bedrock_server"]
