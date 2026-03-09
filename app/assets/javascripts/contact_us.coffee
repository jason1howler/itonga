# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# ViewModel
vm =
  name: ko.observable("")
  email: ko.observable("")
  phone: ko.observable("")
  subject: ko.observable("")
  step: ko.observable(1)
  prev: ->
    step = vm.step() - 1
    if step >= 1
      vm.step(step)
      $('.progress-bar').animate
        width: step * 20 + '%'
  next: ->
    step = vm.step() + 1
    if step <= 5
      vm.step(step)
      $('.progress-bar').animate
        width: step * 20 + '%'

# Custom binding handler
ko.bindingHandlers.fadeVisible =
  init: (element, valueAccessor) ->
    value = valueAccessor()
    $(element).toggle(ko.unwrap(value))
  update: (element, valueAccessor) ->
    value = valueAccessor()
    if ko.unwrap(value)
      $(element).fadeIn()
    else
      $(element).hide()

ko.applyBindings(vm)

# Drop Down functionality
do ->
  # Display Next Button on Input
  steps = document.querySelectorAll(".step")
  previous = document.querySelector(".prev")
  next = document.querySelector(".next")
  done = document.querySelector("#done")
  parent = document.querySelector(".steps")

  for step, i in steps
    step.addEventListener "input", ->
      next.classList.add("next-filled")

  next.addEventListener "click", ->
    next.classList.remove("next-filled")

  done.addEventListener "click", ->
    previous.remove()

  # Ul li Dropdown
  dropDown = document.querySelector('.drop-down')
  dropDownItem = document.querySelectorAll('.drop-down-item')
  dropDownMain = document.querySelector('.drop-down-main')
  hiddenInput = document.querySelector('#hiddenInput')
  arrow = document.querySelector(".arrow")

  triggerInputEvent = new Event('input',
    bubbles: true
    cancelable: true
  )

  dropDownState = false

  toggleDropDown = ->
    dropDownState = !dropDownState

  dropDownMenu = ->
    toggleDropDown()
   
    unless dropDownState
      for item, i in dropDownItem
        item.classList.add("drop-down-item-active")
        arrow.classList.remove("right-arrow")
        arrow.classList.add("down-arrow")
    
    if dropDownState
      for item, o in dropDownItem
        item.classList.remove("drop-down-item-active")
        arrow.classList.add("right-arrow")
        arrow.classList.remove("down-arrow")

  for item, a in dropDownItem
    item.addEventListener "click", ->
      dropDownMenu()
      dropValue = @getAttribute("value")
      dropDownMain.innerHTML = dropValue
      hiddenInput.value = dropValue
      hiddenInput.dispatchEvent(triggerInputEvent)

  dropDownMain.addEventListener "click", dropDownMenu