return {
  -- Manually install the language LazyVim Extra for Markdown (http://www.lazyvim.org/extras/lang/markdown)
  -- Minor customizations here.
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      link = {
        custom = {
          -- remove globe icon from URL links
          web = { pattern = "^http[s]?://", icon = "", highlight = "RenderMarkdownLink" },
        },
      },
    },
  },
}
