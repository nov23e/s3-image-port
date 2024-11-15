FROM node:20-slim AS build
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
COPY . /app
WORKDIR /app
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run generate

FROM gcr.io/distroless/python3
WORKDIR /app/public
COPY --from=build /app/.output /app
EXPOSE 3000
CMD ["-m", "http.server", "3000"]