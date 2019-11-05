--
-- AutoDrive Enter Group Name GUI
-- V1.1.0.0
--
-- @author Stephan Schlosser
-- @date 09/06/2019

adEnterGroupNameGui = {}

local adEnterGroupNameGui_mt = Class(adEnterGroupNameGui, ScreenElement)

function adEnterGroupNameGui:new(target, custom_mt)
    local self = ScreenElement:new(target, adEnterGroupNameGui_mt)
    self.returnScreenName = ""
    self.textInputElement = nil
    return self
end

function adEnterGroupNameGui:onCreateTitleElement(element)
    element:setText(g_i18n:getText("gui_ad_enterGroupNameTitle"))
end

function adEnterGroupNameGui:onCreateTextElement(element)
    element:setText(g_i18n:getText("gui_ad_enterGroupNameText"))
end

function adEnterGroupNameGui:onCreateInputElement(element)
    self.textInputElement = element
    element.text = ""
end

function adEnterGroupNameGui:onOpen()
    adEnterGroupNameGui:superClass().onOpen(self)
    FocusManager:setFocus(self.textInputElement)
    self.textInputElement.blockTime = 0
    self.textInputElement:onFocusActivate()
    self.textInputElement:setText("")
end

function adEnterGroupNameGui:onClickOk()
    adEnterGroupNameGui:superClass().onClickOk(self)
    AutoDrive.addGroup(self.textInputElement.text)
    self:onClickBack()
end

function adEnterGroupNameGui:onClickBack()
    adEnterGroupNameGui:superClass().onClickBack(self)
end

function adEnterGroupNameGui:onClose()
    adEnterGroupNameGui:superClass().onClose(self)
end
