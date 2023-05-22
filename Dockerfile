FROM svhd/logto:latest
COPY . /etc/logto/packages/connector/connector-wechat-miniprogram/
RUN npm add --location=global pnpm@^8.0.0
RUN cd /etc/logto && pnpm -r update && pnpm pnpm:devPreinstall 
RUN pnpm i 
RUN pnpm connectors:build && pnpm cli connector link
WORKDIR /etc/logto
RUN npx @logto/cli connector link
EXPOSE 3001
ENTRYPOINT ["npm", "start"]
