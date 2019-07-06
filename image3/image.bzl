"""A rule for creating an operator container image.
"""

load(
  "@io_bazel_rules_docker//container:image.bzl",
  "container_image"
)

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

  container_image(
    name=name,
    base=base
  )
