return {
    -- Automatically adjust vim indent options based on the current file or
    -- by looking at other files of the same type in the current and parent
    -- directories.
    --
    -- If you ever want to remove this plugin and use per-filetype configurations
    -- see https://www.youtube.com/watch?v=F1CQVXA5gf0&list=PLep05UYkc6wTyBe7kPjQFWVXTlhKeQejM&index=6
    --
    -- IMPORTANT: What matters is the formatter options:
    --   1) Format the file
    --   2) Save it.
    --   2) Re-open it `:e` - indent options are updated based on current format
    'tpope/vim-sleuth',
}
