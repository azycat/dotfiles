return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  -- optional = true,
  opts = {
    formatters_by_ft = {
      -- typescript = { "prettier" },
      -- typescriptreact = { "prettier" },
      -- javascript = { "prettier" },
      -- javascriptreact = { "prettier" },
      -- json = { "prettier" },
      -- html = { "prettier" },
      -- css = { "prettier" },
      -- scss = { "prettier" },
      -- yaml = { "prettier" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      markdown = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      yaml = { "prettierd" },
      -- javascript = { { "prettierd", "prettier" } },
      -- javascriptreact = { { "prettierd", "prettier" } },
      -- html = { { "prettierd", "prettier" } },
      -- css = { { "prettierd", "prettier" } },
      -- json = { { "prettierd", "prettier" } },
      -- yaml = { { "prettierd", "prettier" } },
    },

    -- Customize prettier args
    require("conform.formatters.prettierd").args
      == function(ctx)
        local args = { "--stdin-filepath", "$FILENAME" }
        local localPrettierConfig = vim.fs.find(".prettierrc.json", {
          upward = true,
          path = ctx.dirname,
          type = "file",
        })[1]
        local globalPrettierConfig = vim.fs.find(".prettierrc.json", {
          path = vim.fn.expand("~/.config/nvim"),
          type = "file",
        })[1]

        -- Project config takes precedence over global config
        if localPrettierConfig then
          vim.list_extend(args, { "--config", localPrettierConfig })
        elseif globalPrettierConfig then
          vim.list_extend(args, { "--config", globalPrettierConfig })
        end

        local isUsingTailwind = vim.fs.find("tailwind.config.js", {
          upward = true,
          path = ctx.dirname,
          type = "file",
        })[1]

        local localTailwindcssPlugin = vim.fs.find("node_modules/prettier-plugin-tailwindcss/dist/index.mjs", {
          upward = true,
          path = ctx.dirname,
          type = "file",
        })[1]

        if localTailwindcssPlugin then
          vim.list_extend(args, { "--plugin", localTailwindcssPlugin })
        else
          if isUsingTailwind then
            vim.notify(
              "Tailwind was detected for your project. You can really benefit from automatic class sorting. Please run npm i -D prettier-plugin-tailwindcss",
              vim.log.levels.WARN
            )
          end
        end

        return args
      end,
  },
}
