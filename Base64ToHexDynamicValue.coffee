# in API v0.2.0 and below (Paw 2.2.2 and below), require had no return value
((root) ->
  if root.bundle?.minApiVersion('0.2.0')
    root.base64js = require("./b64")
  else
    require("b64.js")
)(this)

Base64ToHexDynamicValue = () ->

    @createHexString = (byteArray) ->
        result = ""

        for byte, idx in byteArray
            d1 = byte % 16
            d2 = (byte - d1) / 16
            result += "#{ d2.toString(16) }#{ d1.toString(16) }"

        return result

    @evaluate = () ->
        if @input
            byteArray = base64js.toByteArray @input
            return @createHexString byteArray

    @title = () ->
        "Base64 to Hex"

    @text = () ->
        return @input

    return


Base64ToHexDynamicValue.identifier = "com.luckymarmot.PawExtensions.Base64ToHexDynamicValue"
Base64ToHexDynamicValue.title = "Base64 to Hex Dynamic Value"
Base64ToHexDynamicValue.inputs = [
    DynamicValueInput "input", "Input", "String"
]
registerDynamicValueClass Base64ToHexDynamicValue
