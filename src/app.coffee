# reveal.js init
Reveal.initialize({
    # Display controls in the bottom right corner
    controls: true,

    # Display a presentation progress bar
    progress: true,

    # Display the page number of the current slide
    slideNumber: false,

    # Push each slide change to the browser history
    history: false,

    # Enable keyboard shortcuts for navigation
    keyboard: true,

    # Enable the slide overview mode
    overview: true,

    # Vertical centering of slides
    center: true,

    # Enables touch navigation on devices with touch input
    touch: true,

    # Loop the presentation
    loop: false,

    # Change the presentation direction to be RTL
    rtl: false,

    # Turns fragments on and off globally
    fragments: true,

    # Flags if the presentation is running in an embedded mode,
    # i.e. contained within a limited portion of the screen
    embedded: false,

    # Flags if we should show a help overlay when the questionmark
    # key is pressed
    help: true,

    # Number of milliseconds between automatically proceeding to the
    # next slide, disabled when set to 0, this value can be overwritten
    # by using a data-autoslide attribute on your slides
    autoSlide: 0,

    # Stop auto-sliding after user input
    autoSlideStoppable: true,

    # Enable slide navigation via mouse wheel
    mouseWheel: false,

    # Hides the address bar on mobile devices
    hideAddressBar: true,

    # Opens links in an iframe preview overlay
    previewLinks: false,

    # Transition style
    transition: 'convex', # none/fade/slide/convex/concave/zoom

    # Transition speed
    transitionSpeed: 'default', # default/fast/slow

    # Transition style for full page slide backgrounds
    backgroundTransition: 'default', # none/fade/slide/convex/concave/zoom

    # Number of slides away from the current that are visible
    viewDistance: 3,

    # Parallax background image
    parallaxBackgroundImage: '', # e.g. "'https:#s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'"

    # Parallax background size
    parallaxBackgroundSize: '' # CSS syntax, e.g. "2100px 900px"


});

# executor init
windows = []
commands =   {
  left: () ->
    Reveal.left()
  right: () ->
    Reveal.right()
  up: () ->
    Reveal.up()
  down: () ->
    Reveal.down()
  play: (artist...) ->
    aname = artist.reduce((a, b) -> "#{a}+#{b}")
    windows.push(
      open("http://www.jango.com/music/#{aname}")
    )
  sing: () ->
    audio = document.getElementsByTagName('audio')[0]
    audio.play()
  search: (term...) ->
    joined = term.reduce((a, b) -> "#{a}+#{b}")
    windows.push(
      open("https://www.google.com/search?q=#{joined}")
    )
  clothes: () ->
    for w in windows
      w.close()
}

exe = new Executor(
  commands: commands
  debug: true
)
exe.start()
