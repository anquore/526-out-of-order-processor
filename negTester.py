def main():
  oneString = "1111"
  address = -10
  addressinBinary = "{0:b}".format(address)
  negString = convertToNeg(addressinBinary[1:])
  print(negString)
  addressinBinary1 = oneString + negString
  print(addressinBinary1)
  
  address = -7
  addressinBinary = "{0:b}".format(address)
  negString = convertToNeg(addressinBinary[1:])
  print(negString)
  addressinBinary1 = oneString + negString
  print(addressinBinary1)

def convertToNeg(input):
  #invert the string
  newString = []
  
  for i in range(0, len(input)):
    if(input[(len(input) - 1) - i] == '0'):
      newString.append('1')
    else:
      newString.append('0')
      
  print(newString)
      
  #add the 1
  carryin = 1
  for i in range(0, len(input)):
    if(newString[i] == '0' and carryin == 0):
      newString[i] = '0'
      carryin = 0
    elif (newString[i] == '1' and carryin == 0):
      newString[i] = '1'
      carryin = 0
    elif(newString[i] == '0' and carryin == 1):
      newString[i] = '1'
      carryin = 0
    else:
      newString[i] = '0'
      carryin = 1
      
    print(newString[i])
      
  returnString = ""
  for i in range(0, len(input)):
    returnString = newString[i] + returnString
  #print(returnString)    
  return returnString
  
  
if __name__=='__main__':
    main()  