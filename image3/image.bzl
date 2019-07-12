"""A rule for creating an operator container image.
"""

load(
  "@io_bazel_rules_docker//container:image.bzl",
  "container_image"
)

load(
  "@io_bazel_rules_docker//container:container.bzl",
  "container_push"
)

load(":file.bzl", "file")

def operator_image(
  name,
  base = None,
  deps = [],
  **kwargs):
  """Builds an operator container image.
    Args:
      name: Name of the operator_image target.
      base: Base image to use for the operator_image.
      deps: Dependencies of the operator image target.
  """
  file(
      name = "list",
      content = "A\nB\n",
  )

  container_image(
    name=name,
    base=base,
    files=["//image3:list.txt"]
  )

  container_push(
   name = "publish",
   image = ":image3",
   format = "Docker",
   registry = "localhost:5000",
   repository = "image3"
)
