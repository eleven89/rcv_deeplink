

RcvDeeplink is a simple gem to help generate links to specific chapters on the 
[Recovery Version text web site](https://text.recoveryversion.bible) at https://text.recoveryversion.bible.


# Usage 

1. Install gem
2. To get a full URL, invoke via RcvDeeplink.url(<book_number>, <chapter_number>)
3. For just the URL path, use RcvDeeplink.path(<book_number, <chapter_number>)


# Examples

## For Genesis, chapter 1:
### I want the full URL with an anchor tag that jumps to the first verse of the chapter:
`RcvDeeplink.url(1,1)`
results in 
`"https://text.recoveryversion.bible/01_Genesis_1.htm#Gen1-1"`

### I just want the path:
`RcvDeeplink.path(1,1)`
results in 
`"01_Genesis_1.htm#Gen1-1"`

### I want the full URL that anchors to a specific verse in the chapter. So pass in the chapter as the third parameter
`RcvDeeplink.url(1,1,5)`
results in 
`"https://text.recoveryversion.bible/01_Genesis_1.htm#Gen1-5"`

### I want the URL for the chapter without jumping to a verse.  So pass in 0 as the third parameter (verse number)
`RcvDeeplink.url(1,1,0)`
results in 
`"https://text.recoveryversion.bible/01_Genesis_1.htm#Gen1"`

# Testing

Run `rake` to run the small test suite.
