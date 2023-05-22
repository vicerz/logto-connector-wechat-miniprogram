FROM svhd/logto:latest
COPY . /etc/logto/packages/connector/connector-wechat-miniprogram
RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.shrc" SHELL="$(which sh)" sh -
RUN cd /etc/logto && pnpm npm:devPreinstall && pnpm i && pnpm connectors:build && pnpm cli connector link
WORKDIR /etc/logto
EXPOSE 3001
ENTRYPOINT ["npm", "start"]
