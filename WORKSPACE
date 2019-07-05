workspace(name = "myproject")

load(
  "@bazel_tools//tools/build_defs/repo:http.bzl",
  "http_archive"
)

http_archive(
  name = "io_bazel_rules_docker",
  sha256 = "87fc6a2b128147a0a3039a2fd0b53cc1f2ed5adb8716f50756544a572999ae9a",
  strip_prefix = "rules_docker-0.8.1",
  urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.8.1.tar.gz"],
)

register_toolchains(
  "@io_bazel_rules_docker//toolchains/docker:default_linux_toolchain",
  "@io_bazel_rules_docker//toolchains/docker:default_windows_toolchain",
  "@io_bazel_rules_docker//toolchains/docker:default_osx_toolchain",
)

skylib_version = "0.8.0"
http_archive(
  name = "bazel_skylib",
  type = "tar.gz",
  url = "https://github.com/bazelbuild/bazel-skylib/releases/download/{}/bazel-skylib.{}.tar.gz".format (skylib_version, skylib_version),
  sha256 = "2ef429f5d7ce7111263289644d233707dba35e39696377ebab8b0bc701f7818e",
)

load("@io_bazel_rules_docker//toolchains/docker:toolchain.bzl",
    docker_toolchain_configure="toolchain_configure"
)
docker_toolchain_configure(
  name = "docker_config",
  client_config="/path/to/docker/client/config",
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)
container_repositories()

load(
  "@io_bazel_rules_docker//container:container.bzl",
  "container_pull",
)
container_pull(
  name = "mysql",
  registry = "index.docker.io",
  repository = "library/mysql",
  digest = "sha256:710c9ca6c4df66bf0c93df0d761e0519018fa2f0edb8015bb0db6c7c3919a8e2"
)
