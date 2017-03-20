//This is used to calculate line breaks before the text begins to type
//out, to prevent line breaks in the middle of a word.
if string_copy(str[message_display],1,position) != str[message_display]
{
while(string_copy(str[message_display],1,position) != str[message_display])
{
//Adds one to the position.
position += 1
//Adds the width of the next character to the width counter
width_counter += string_width(string_char_at(str[message_display],position))
//If the character at the position pst is a space...
if string_char_at(str[message_display],position) = " "
//Update the last_space variable to pst.
last_space = position
//If the character at the position pst is a line break symbol...
if string_char_at(str[message_display],position) = "#"
//Restart the width counter. This is used in case you want to add
//manual line breaks.
width_counter = 0
//If the width of the characters exceeds the number that's allowed in a line...
if width_counter > line_length
{
//When creating a line break, make sure that the width of the extra letters 
//that are being placed into the next row are being counted for.
width_counter = string_width(string_copy(string_copy(str[message_display],1,position),last_space+1,string_length(string_copy(str[message_display],1,position))-last_space+1))
//Add a line break after the last space.
str[message_display] = string_copy(str[message_display],1,last_space)+"#"+string_copy(str[message_display],last_space+1,string_length(str[message_display])-last_space)
}
}
}
else
{
//Adds one to the position of the display string.
display_position += 1
//Update the string that's being displayed.
display_string = string_copy(str[message_display],1,display_position)
}
