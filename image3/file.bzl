"""Generate a file.
In this example, the content is passed via an attribute. If you generate
large files with a lot of static content, consider using
`ctx.actions.expand_template` instead.
"""

load(
  "@io_bazel_rules_docker//container:providers.bzl",
  "ImageInfo",
)

def _impl(ctx):
    ctx.actions.run_shell(
        outputs = [ctx.outputs.out],
        command = "\n".join([
            "cat %s %s > %s" % (
                ctx.attr.deps[0][ImageInfo].container_parts['digest'].path,
                ctx.attr.deps[1][ImageInfo].container_parts['digest'].path,
                ctx.outputs.out.path
            )
        ]),
    )

operator_file = rule(
  implementation = _impl,
  attrs = {
    "deps": attr.label_list(providers = [ImageInfo]),
  },
  outputs = {"out": "%{name}.txt"},
)
