local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, bg = "#282c34",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true,  bg = "#86A397",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true,  bg = "#20A39E",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true,  bg = "#A4A9AD",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true,  bg = "#A14A76",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true,  bg = "#40798C",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true,  bg = "#70A9A1",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true,  bg = "#F78764",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true,  bg = "#F4D35E",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true,  bg = "#DA4167",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true,  bg = "#0055a0",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true,  bg = "#04A777",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true,  bg = "#820263",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true,  bg = "#D90368",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true,  bg = "#F75C03",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true,  bg = "#723D46",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true,  bg = "#93BEDF",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true,  bg = "#858AE3",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true,  bg = "#613DC1",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true,  bg = "#2C0735",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true,  bg = "#97DFFC",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true,  bg = "#990D35",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true,  bg = "#D52941",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true,  bg = "#FCD581",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true,  bg = "#9DB4C0",  fg = "#C297B8"})
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true,  bg = "#F64740",  fg = "#C297B8"})

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
navic.setup {
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = ' ',
    Interface = ' ',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' '
  },
  highlight = true,
  separator = " ⟩ ",
}

