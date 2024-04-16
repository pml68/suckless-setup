/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
static const unsigned int alpha = 0xbe;
static int centered = 1;    /* -c option; centers dmenu on screen */
static int min_width = 500; /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {"JetBrainsMono NF:style=Bold:size=12"};
static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = {"#e0def4", "#191724"},
    [SchemeSel] = {"#e0def4", "#575e6e"},
    [SchemeOut] = {"#e0def4", "#dde1e7"},
};

static const unsigned int alphas[SchemeLast][2] = {
    [SchemeNorm] = {OPAQUE, alpha},
    [SchemeSel] = {OPAQUE, alpha},
    [SchemeOut] = {OPAQUE, alpha},
};

/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines = 10;
static unsigned int columns = 1;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
