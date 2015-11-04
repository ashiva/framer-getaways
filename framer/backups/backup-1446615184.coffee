## SETUP ###

backgroundLayer = new Layer
	x:0
	y:0
	width:642
	height:1136
	image:"images/hawaii.jpg"
	originX: 0.5
	originY: 0
	opacity: 1

profile = new Layer
	x:0
	y:0
	width:640
	height:1001
	image:"images/profile.jpg"
	opacity: 1
	
menu = new Layer
	x: 30
	y: 45
	width:50
	height:35
	opacity: 1
	image:"images/menu.png"

logo = new Layer
	x: 230
	y: 40
	width:184
	height:59
	image:"images/Getaways.png"
	
keyboard = new Layer
	x: 0
	y: 1136
	width:640
	height:432
	image:"images/keyboard.jpg"

searchBox = new Layer
	x: 74
	y: 135
	width: 500
	height: 80
	opacity: 0.3
	
searchBox.html = "Find your Getaway..."

searchIcon = new Layer
	x:  25
	y: -28
	width: 36
	height: 36
	image:"images/search.png"
	opacity: 0.8
	
searchIcon.superLayer = searchBox
	
cardOne = new Layer
	x: 0
	y: 270	
	width: 640
	height: 1200

cardTwo = new Layer
	x: 0
	y: 475	
	width: 640
	height: 1200

cardThree = new Layer
	x: 0
	y: 680	
	width: 640
	height: 1200
		
cardOneLabel = new Layer
	y: 32
	width: 640
	height: 100

cardTwoLabel = new Layer
	y: 32
	width: 640
	height: 100

cardThreeLabel = new Layer
	y: 32
	width: 640
	height: 100

cardOneContent = new Layer
	x: 0
	y: 0
	width: 640
	height: 1450
	image: "images/cards-tonight.png"
	
cardTwoContent = new Layer
	x: 0
	y: 0
	width: 640
	height: 1056
	image: "images/inspire.png"

cardThreeContent = new Layer
	x: 0
	y: 0
	width: 640
	height: 1450
	image: "images/cards.png"
	
cardOneLabel.html = "Seattle Tonight"
cardTwoLabel.html = "Popular Categories"
cardThreeLabel.html = "New Deals"

cardOneContent.superLayer = cardOne
cardOneLabel.superLayer = cardOne
cardTwoContent.superLayer = cardTwo
cardTwoLabel.superLayer = cardTwo
cardThreeContent.superLayer = cardThree
cardThreeLabel.superLayer = cardThree

mainContainer = new Layer
	width: 640
	height: 1136
	backgroundColor: "#333"

recentSearch = new Layer
	x: 0
	y: 170
	width: 640
	height: 421
	opacity: 0
	image:"images/recent.png"

filterSet = new Layer
	x: 0
	y: 150
	width: 640
	height: 870
	opacity: 0
	image:"images/filterset.jpg"

layerList = 	[
	recentSearch,
	filterSet,
	backgroundLayer,
	cardOne,
	cardTwo,
	cardThree,
	searchBox,
	menu,
	logo,
	keyboard
]

layerList.map (item) ->
	item.superLayer = mainContainer

mainContainer.bringToFront()
backgroundLayer.sendToBack()

### STYLING ###

searchBoxStyle = {
  "color": "#6ee3ff",
	"font-family":"Open Sans",
	"font-weight":"300",
	"font-size": "30px",
	"padding-top": "23px",
	"border-radius": "50px",
	"text-align": "center",
	"backgroundColor":"#000",
	"font-face": "Open Sans",
}

# cardStyle = {
#   "color": "#333",
# 	"font-family":"Open Sans",
# 	"border" : "1px solid #ccc",
# 	"border-radius": "15px",
# 	"text-align": "center",
# 	"backgroundColor":"#ffffff",
# 	"box-shadow":"0px -5px 15px 5px rgba(0,0,0,0.07)"
# }

cardStyle = {
  "color": "#fff",
	"font-family":"Open Sans",
	"border-radius": "15px",
	"text-align": "center",
	"backgroundColor":"transparent",
	"box-shadow":"0px -5px 15px 5px rgba(0,0,0,0.12)"
}

cardLabelStyle = {
  "color": "#fff",
	"font-weight": "300",
	"font-size": "31px",
	"text-align": "center",
	"backgroundColor":"transparent"
}

cardOne.style = cardStyle
cardTwo.style = cardStyle
cardThree.style = cardStyle
cardOneLabel.style = cardLabelStyle
cardTwoLabel.style = cardLabelStyle
cardThreeLabel.style = cardLabelStyle
searchBox.style = searchBoxStyle

### ARROWS ###

# arrow = []
# for i in [1 .. 3]
# 	arrow[i] = new Layer x:30, y:35, width:35, height:21, image:"images/arrow.png"
# 	arrow[i].states.add
# 		hide: {opacity: 0}
# 	arrow[i].states.animationOptions =
# 		curve: "ease-out"
# 		time: 0.25

# arrow[1].superLayer = cardOne
# arrow[2].superLayer = cardTwo
# arrow[3].superLayer = cardThree
	
### CLOSE ###

close = new Layer x:640, y:55, width:34, height:35, opacity: 0, image:"images/x.png"

close.states.add
	show: {opacity: 1, y:60, x:570}

close.states.animationOptions =
	curve: "ease-out"
	time: 0.2
	
### FILTERS ###

cardOneDates = new Layer
	x: 30
	y: 25
	width: 146
	height: 44
	opacity: 0
	image: "images/selectDates.png"

cardOneFilter = new Layer
	x: 573
	y: 22
	width: 44
	height: 44
	opacity: 0
	image: "images/filters.png"
	
cardOneDates.superLayer = cardOne
cardOneFilter.superLayer = cardOne

cardOneDates.states.add
	show: {opacity: 1}

cardOneFilter.states.add
	show: {opacity: 1}
	
# Scrolling
cardOne.scrollVertical = true
cardTwo.scrollVertical = true
cardThree.scrollVertical = true

# States
cardOne.states.add
	show: {y: 160}
	filters: {y: 1050}
	down: {y: 1136}

cardTwo.states.add
	show: {y: 160}
	down: {y: 1136}

cardThree.states.add
	show: {y: 160}
	down: {y: 1136}
	
searchBox.states.add
	top: {y:40, x: 110, width: 430}
	hide: {opacity: 0}
	
backgroundLayer.states.add
	menu: {y: 500}

logo.states.add
	hide: {opacity: 0, y: -10, scale: 0.7}

menu.states.add
	move: {y: 60}
	hide: {opacity: 0}

keyboard.states.add
	move: {y: 700}
				
mainContainer.states.add
	move: {y: 750}

cardOneLabel.states.add
	hide: {opacity: 0}

recentSearch.states.add
	up: {opacity: 0.9}

filterSet.states.add
	up: {opacity: 0.9}
	
# Set the default animation options for the layer

bounceSpring = "spring(200,22,12)"

cardList = [cardOne,cardTwo,cardThree]
cardList.map (item) ->
	item.states.animationOptions =
		curve: bounceSpring
		time: 100

recentSearch.states.animationOptions =
	curve: "ease-in"
	time: 0.1

filterSet.states.animationOptions =
	curve: "ease-in"
	time: 0.1
	
keyboard.states.animationOptions =
	curve: "ease-in"
	time: 0.2
	
searchBox.states.animationOptions =
	curve: bounceSpring
	time: 0.1

backgroundLayer.states.animationOptions =
	time: 0.1

menu.states.animationOptions =
	curve: bounceSpring
	time: 0.1

mainContainer.states.animationOptions =
	curve: bounceSpring
	time: 0.1

cardOneFilter.states.animationOptions =
	time: 0.1

cardOneDates.states.animationOptions =
	time: 0.1

cardOneLabel.states.animationOptions =
	time: 0.1

logo.states.animationOptions =
	time: 0.1


# Touch events

cardExposed = false

cardOne.on Events.TouchStart, -> 
	event.stopPropagation()
	if cardExposed is false
		cardOneShow()
		cardExposed = true
	else
		reset()
		cardExposed = false

cardTwo.on Events.TouchStart, -> 
	event.stopPropagation()
	if cardExposed is false
		cardTwoShow()
		cardExposed = true
	else
		reset()
		cardExposed = false

cardThree.on Events.TouchStart, -> 
	event.stopPropagation()
	if cardExposed is false
		cardThreeShow()
		cardExposed = true
	else
		reset()
		cardExposed = false
		
cardOne.on Events.DragMove, -> 
	cardOneShow()
	
cardTwo.on Events.DragMove, -> 
	cardTwoShow()
	
cardThree.on Events.DragMove, -> 
	cardThreeShow()
	
cardOneShow = () ->
	mainContainer.states.switch "default"
	cardTwo.states.switch "down"
	cardThree.states.switch "down"
	cardOne.states.switch "show"
	cardOne.bringToFront()
	cardOneLabel.states.switch "hide"
# 	arrow[1].states.switch "hide"
	searchBox.html = "Seattle, WA"
	cardOneFilter.states.switch "show"
	cardOneDates.states.switch "show"
	moveSearch()
	
cardTwoShow = () ->
	mainContainer.states.switch "default"
	cardOne.states.switch "down"
	cardThree.states.switch "down"
	cardTwo.states.switch "show"
	cardTwo.bringToFront()
# 	arrow[2].states.switch "hide"
	searchBox.html = "All Locations"
	moveSearch()

cardThreeShow = () ->
	mainContainer.states.switch "default"
	cardOne.states.switch "down"
	cardTwo.states.switch "down"
	cardThree.states.switch "show"
	cardThree.bringToFront()
# 	arrow[3].states.switch "hide"
	searchBox.html = "All Locations"
	moveSearch()
	
moveSearch = () ->
	searchBox.states.switch "top"
	menu.states.switch "move"
	close.states.switch "show"
	logo.states.switch "hide"
	
backgroundLayer.on Events.TouchStart, ->
	reset()
	
searchBox.on Events.TouchStart, ->
	event.stopPropagation()
	recentSearch.states.switch "up"
	keyboard.bringToFront
	keyboard.states.switch "move"
	mainContainer.states.switch "default"
	cardOne.states.switch "down"
	cardTwo.states.switch "down"
	cardThree.states.switch "down"
	searchBox.html = "|"
	filterSet.states.switch "default"
	moveSearch()

recentSearch.on Events.TouchStart, ->
	cardOneShow()
	keyboard.states.switch "default"
	recentSearch.states.switch "default"
	searchBox.html = "Seattle, WA"

menuExposed = false
menu.on Events.TouchStart, ->
	event.stopPropagation()
	if menuExposed is false
		mainContainer.states.switch "move"
		close.states.switch "default"
		menuExposed = true
	else
		reset()
		menuExposed = false

filtersExposed = false
cardOneFilter.on Events.TouchStart, ->
	event.stopPropagation()
	if filtersExposed is false
		cardOne.states.switch "filters"
		filterSet.states.switch "up"
		filtersExposed = true
	else
		cardOneShow()
		filterSet.states.switch "default"
		filtersExposed = false

### RESET CARDS ###
reset = () ->
	
	defaultList = 	[
		mainContainer,
		cardOne,
		cardTwo,
		cardThree,
		logo,
		backgroundLayer,
# 		arrow[1],
# 		arrow[2],
# 		arrow[3],
		searchBox,
		menu,
		keyboard,
		close,
		cardOneFilter,
		cardOneDates,
		recentSearch,
		cardOneLabel,
		filterSet
	]

	defaultList.map (item) ->
		item.states.switch "default"
		
	cardOne.sendToBack()
	cardThree.bringToFront()
	backgroundLayer.sendToBack()
	searchBox.html = "Find your Getaway..."
