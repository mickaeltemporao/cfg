# import theme
import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

# theme specs
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

## Directory to save downloads to.
c.downloads.location.directory = "/tmp/"

## Prompt the user for the download location.
c.downloads.location.prompt = False

## Automatically start playing <video> elements.
c.content.autoplay = False

## Always restore open sites when qutebrowser is reopened.
## Type: Bool
c.auto_save.session = True

## How to open links in an existing instance if a new one is launched.
## This happens when e.g. opening a link from a terminal. See
## `new_instance_open_target_window` to customize in which window the
## link is opened in.
## Type: String
## Valid values:
##   - tab: Open a new tab in the existing window and activate the window.
##   - tab-bg: Open a new background tab in the existing window and activate the window.
##   - tab-silent: Open a new tab in the existing window without activating the window.
##   - tab-bg-silent: Open a new background tab in the existing window without activating the window.
##   - window: Open in a new window.
c.new_instance_open_target = 'tab-silent'

## Which window to choose when opening links as new tabs. When
## `new_instance_open_target` is not set to `window`, this is ignored.
## Type: String
## Valid values:
##   - first-opened: Open new tabs in the first (oldest) opened window.
##   - last-opened: Open new tabs in the last (newest) opened window.
##   - last-focused: Open new tabs in the most recently focused window.
##   - last-visible: Open new tabs in the most recently visible window.
c.new_instance_open_target_window = 'last-focused'

## Open new tabs (middleclick/ctrl+click) in the background.
## Type: Bool
c.tabs.background = True

## Scaling for favicons in the tab bar. The tab size is unchanged, so big
## favicons also require extra `tabs.padding`.
## Type: Float
c.tabs.favicons.scale = 1.25

## Alignment of the text inside of tabs.
## Type: TextAlignment
## Valid values:
##   - left
##   - right
##   - center
c.tabs.title.alignment = 'left'

## The format to use for the window title.
c.window.title_format = '{perc}{current_title}'
c.tabs.title.format = '{current_title}'

## Font used in the tab bar.
c.fonts.tabs.selected = '12pt monospace'
c.fonts.tabs.unselected = '10pt monospace'

## Font used for the hints.
c.fonts.hints = 'bold 14pt monospace'

## Font used in the keyhint widget.
c.fonts.keyhint = '14pt monospace'

## Font used in the statusbar.
c.fonts.statusbar = '10pt monospace'

## Default zoom level.
c.zoom.default = 150

