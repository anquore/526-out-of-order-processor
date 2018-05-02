import math
#import numpy as np

#math op codes
AND = '100_0101_0000'
ADD = '100_0101_1000'
ADDS = '101_0101_1000'
SUB = '110_0101_1000'
SUBS = '111_0101_1000'
OR = '101_0101_0000'
XOR = '110_0101_0000'
BR = '110_1011_0000'
MULT = '100_1101_1000'
DIV = '100_1101_0110'

#conditional branching opcodes
BCOND = '010_1010_0'
CBZ = '101_1010_0'
EQ = '00000'
NE = '00001'
GE = '01010'
LT = '01011'
GT = '01100'
LE = '01101'

#basic branch
B = '000_101'
BL = '100_101'

#memory commands
LDUR = '111_1100_0010'
STUR = '111_1100_0000'

#immediate commands
ADDI = '100_1000_100'

#shift commands
LSL = '110_1001_1011'
LSR = '110_1001_1010'

def main():
  #clear the file
  theFile = open('testing.arm','w')
  theFile.write("//Starting assembly\n")
  theFile.close()
  
  #open the file to append
  theFile = open('testing.arm','a')
  
  #setup some starting variables
  immediateCommand('ADDI', ADDI, 1, 0, 31, theFile)
  immediateCommand('ADDI', ADDI, 5, 1, 31, theFile)
  immediateCommand('ADDI', ADDI, 8, 2, 31, theFile)
  
  #do the following math
  mathCommand('AND', AND, 3, 2, 1, theFile)
  mathCommand('ADD', ADD, 4, 2, 1, theFile)
  mathCommand('ADDS', ADDS, 5, 2, 1, theFile)
  mathCommand('SUB', SUB, 6, 2, 1, theFile)
  mathCommand('SUBS', SUBS, 7, 2, 1, theFile)
  mathCommand('OR', OR, 8, 2, 1, theFile)
  mathCommand('XOR', XOR, 9, 2, 1, theFile)
  
  #do some memory work
  memoryCommand('STUR', STUR, 0, 0, 31, theFile)
  memoryCommand('STUR', STUR, 8, 1, 31, theFile)
  memoryCommand('LDUR', LDUR, 8, 16, 31, theFile)
  memoryCommand('LDUR', LDUR, 0, 15, 31, theFile)
  
  #branch testing
  #R1 > R0, success
  mathCommand('SUBS', SUBS, 31, 0, 1, theFile)
  condBranchCommand('GT', BCOND, 4, GT, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #fail branch
  branchCommand('B', B, 0, theFile) #17 * 4 = 68
  mathCommand('SUB', SUB, 31, 31, 31, theFile) #72
  
  #R0 > R1 fail
  mathCommand('SUBS', SUBS, 31, 1, 0, theFile) #76
  condBranchCommand('GT', BCOND, -3, GT, theFile) #80
  mathCommand('SUB', SUB, 31, 31, 31, theFile) #84
  
  
  #R0 < R1, success
  mathCommand('SUBS', SUBS, 31, 1, 0, theFile)
  condBranchCommand('LT', BCOND, 4, LT, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #fail branch
  branchCommand('B', B, 0, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R1 < R0 fail
  mathCommand('SUBS', SUBS, 31, 0, 1, theFile)
  condBranchCommand('LT', BCOND, -3, LT, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  
  #R1 >= R0, success
  mathCommand('SUBS', SUBS, 31, 0, 1, theFile)
  condBranchCommand('GE', BCOND, 4, GE, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #fail branch
  branchCommand('B', B, 0, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R6 >= R7 success
  mathCommand('SUBS', SUBS, 31, 6, 7, theFile)
  condBranchCommand('GE', BCOND, 4, GE, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #fail branch
  branchCommand('B', B, 0, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R0 >= R1 fail
  mathCommand('SUBS', SUBS, 31, 1, 0, theFile)
  condBranchCommand('GT', BCOND, -3, GE, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R0 <= R1, success
  mathCommand('SUBS', SUBS, 31, 1, 0, theFile)
  condBranchCommand('LE', BCOND, 4, LE, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #fail branch
  branchCommand('B', B, 0, theFile) #184/188
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R6 >= R7 success
  mathCommand('SUBS', SUBS, 31, 6, 7, theFile)
  condBranchCommand('LE', BCOND, 4, LE, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #fail branch
  branchCommand('B', B, 0, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R1 <= R0 fail
  mathCommand('SUBS', SUBS, 31, 0, 1, theFile)
  condBranchCommand('LE', BCOND, -3, LE, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R6 == R7 success
  mathCommand('SUBS', SUBS, 31, 6, 7, theFile)
  condBranchCommand('EQ', BCOND, 4, EQ, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #fail branch
  branchCommand('B', B, 0, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R1 == R0 fail
  mathCommand('SUBS', SUBS, 31, 0, 1, theFile)
  condBranchCommand('EQ', BCOND, -3, EQ, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R1 != R0 success
  mathCommand('SUBS', SUBS, 31, 0, 1, theFile)
  condBranchCommand('NE', BCOND, 4, NE, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #fail branch
  branchCommand('B', B, 0, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #R6 == R7 fail
  mathCommand('SUBS', SUBS, 31, 7, 6, theFile)
  condBranchCommand('NE', BCOND, -3, NE, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #testing shifts
  shiftCommand('LSL', LSL, 10, 3, 1, theFile)
  shiftCommand('LSR', LSR, 11, 3, 10, theFile)
  
  #testing multiply
  #send one multiply then an add
  mathCommand('MULT', MULT, 20, 7, 6, theFile)
  mathCommand('ADD', ADD, 21, 5, 4, theFile)
  
  #send two multiples then a subs
  mathCommand('MULT', MULT, 22, 7, 6, theFile)
  mathCommand('MULT', MULT, 23, 5, 4, theFile)
  mathCommand('SUBS', SUBS, 31, 6, 7, theFile)
  
  #do a multiply then a branch
  mathCommand('MULT', MULT, 24, 5, 6, theFile)
  condBranchCommand('EQ', BCOND, 4, EQ, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #fail branch
  branchCommand('B', B, 0, theFile)
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  #do an add to check branch happened
  mathCommand('ADD', ADD, 25, 5, 4, theFile)
  
  #check some forwarding
  mathCommand('MULT', MULT, 20, 5, 4, theFile)
  mathCommand('ADD', ADD, 21, 20, 4, theFile)
  mathCommand('ADD', ADD, 22, 5, 20, theFile)
  
  mathCommand('ADD', ADD, 23, 2, 1, theFile)
  mathCommand('MULT', MULT, 24, 23, 4, theFile)
  mathCommand('MULT', MULT, 26, 5, 23, theFile)
  mathCommand('DIV', DIV, 27, 23, 24, theFile)
  
  #halt
  branchCommand('B', B, 0, theFile)#288
  mathCommand('SUB', SUB, 31, 31, 31, theFile)
  
  theFile.close()

def mathCommand(name, opcode, RD, RM, RN, theFile):
  #generate the opcode
  #opcode = '100_0101_0000'
  
  #convert the inputs to binary
  zeroString = '00000'
  RMinBinary = "{0:b}".format(RM)
  RNinBinary = "{0:b}".format(RN)
  RDinBinary = "{0:b}".format(RD)
  
  #merge the string
  RMinBinary1 = zeroString + RMinBinary
  RNinBinary1 = zeroString + RNinBinary
  RDinBinary1 = zeroString + RDinBinary
  
  #get the lengths
  numRM = len(RMinBinary1)
  numRN = len(RNinBinary1)
  numRD = len(RDinBinary1)
   
  #strip them to the correct length
  numRM1 = numRM - 5
  numRN1 = numRN - 5
  numRD1 = numRD - 5
  RMcorrect = RMinBinary1[numRM1:]
  RNcorrect = RNinBinary1[numRN1:]
  RDcorrect = RDinBinary1[numRD1:]
  
  #assign SHAMT
  SHAMT = '000000'
  
  #combine for full command
  cmd = opcode + '_' + RMcorrect + '_' + SHAMT + '_' + RNcorrect + '_' + RDcorrect
  
  #write to file
  theFile.write('//' + name + '\n')
  theFile.write(cmd + '\n')
  
def shiftCommand(name, opcode, RD, SHAMT, RN, theFile):
  #generate the opcode
  #opcode = '100_0101_0000'
  
  #convert the inputs to binary
  zeroString = '00000'
  shiftString = '000000'
  SHAMTinBinary = "{0:b}".format(SHAMT)
  RNinBinary = "{0:b}".format(RN)
  RDinBinary = "{0:b}".format(RD)
  
  #merge the string
  SHAMTinBinary1 = shiftString + SHAMTinBinary
  RNinBinary1 = zeroString + RNinBinary
  RDinBinary1 = zeroString + RDinBinary
  
  #get the lengths
  numSHAMT = len(SHAMTinBinary1)
  numRN = len(RNinBinary1)
  numRD = len(RDinBinary1)
   
  #strip them to the correct length
  numSHAMT1 = numSHAMT - 6
  numRN1 = numRN - 5
  numRD1 = numRD - 5
  SHAMTcorrect = SHAMTinBinary1[numSHAMT1:]
  RNcorrect = RNinBinary1[numRN1:]
  RDcorrect = RDinBinary1[numRD1:]
  
  #assign RM
  RM = '00000'
  
  #combine for full command
  cmd = opcode + '_' + RM + '_' + SHAMTcorrect + '_' + RNcorrect + '_' + RDcorrect
  
  #write to file
  theFile.write('//' + name + '\n')
  theFile.write(cmd + '\n')
  
def memoryCommand(name, opcode, address, RD, RN, theFile):
  #generate the opcode
  #opcode = '100_0101_0000'
  
  #convert the inputs to binary
  zeroString = '00000'
  zeroStringLong = '000000000'
  oneString = '111111111'
  addressinBinary = "{0:b}".format(address)
  RNinBinary = "{0:b}".format(RN)
  RDinBinary = "{0:b}".format(RD)
  
  #merge the string
  if address < 0:
    negString = convertToNeg(addressinBinary[1:])
    addressinBinary1 = oneString + negString
  else:
    addressinBinary1 = zeroStringLong + addressinBinary
  RNinBinary1 = zeroString + RNinBinary
  RDinBinary1 = zeroString + RDinBinary
  
  #get the lengths
  numaddress = len(addressinBinary1)
  numRN = len(RNinBinary1)
  numRD = len(RDinBinary1)
   
  #strip them to the correct length
  numaddress1 = numaddress - 9
  numRN1 = numRN - 5
  numRD1 = numRD - 5
  addresscorrect = addressinBinary1[numaddress1:]
  RNcorrect = RNinBinary1[numRN1:]
  RDcorrect = RDinBinary1[numRD1:]
  
  #combine for full command
  cmd = opcode + '_' + addresscorrect + '_' + '00' + '_' + RNcorrect + '_' + RDcorrect
  
  #write to file
  theFile.write('//' + name + '\n')
  theFile.write(cmd + '\n')
  
def immediateCommand(name, opcode, immediate, RD, RN, theFile):
  #generate the opcode
  #opcode = '100_0101_0000'
  
  #convert the inputs to binary
  zeroString = '00000'
  zeroStringLong = '00000000000'
  oneString = '11111111111'
  immediateinBinary = "{0:b}".format(immediate)
  RNinBinary = "{0:b}".format(RN)
  RDinBinary = "{0:b}".format(RD)
  
  #merge the string
  if immediate < 0:
    negString = convertToNeg(addressinBinary[1:])
    immediateinBinary1 = oneString + negString
  else:
    immediateinBinary1 = zeroStringLong + immediateinBinary
  RNinBinary1 = zeroString + RNinBinary
  RDinBinary1 = zeroString + RDinBinary
  
  #get the lengths
  numimmediate = len(immediateinBinary1)
  numRN = len(RNinBinary1)
  numRD = len(RDinBinary1)
   
  #strip them to the correct length
  numimmediate1 = numimmediate - 12
  numRN1 = numRN - 5
  numRD1 = numRD - 5
  immediatecorrect = immediateinBinary1[numimmediate1:]
  RNcorrect = RNinBinary1[numRN1:]
  RDcorrect = RDinBinary1[numRD1:]
  
  #combine for full command
  cmd = opcode + '_' + immediatecorrect + '_' + RNcorrect + '_' + RDcorrect
  
  #write to file
  theFile.write('//' + name + '\n')
  theFile.write(cmd + '\n')
  
def branchCommand(name, opcode, address, theFile):
  #generate the opcode
  #opcode = '100_1010_0000'
  
  #convert the inputs to binary
  zeroString = '00000000000000000000000000'
  oneString = '11111111111111111111111111'
  addressinBinary = "{0:b}".format(address)
  
  #merge the string
  if address < 0:
    negString = convertToNeg(addressinBinary[1:])
    addressinBinary1 = oneString + negString
  else:
    addressinBinary1 = zeroString + addressinBinary
  
  #get the lengths
  numaddress = len(addressinBinary1)
   
  #strip them to the correct length
  numaddress1 = numaddress - 26
  addresscorrect = addressinBinary1[numaddress1:]
  
  #combine for full command
  cmd = opcode + '_' + addresscorrect
  
  #write to file
  theFile.write('//' + name + '\n')
  theFile.write(cmd + '\n')
  
def condBranchCommand(name, opcode, address, RT, theFile):
  #generate the opcode
  #opcode = '100_1010_0000'
  
  #convert the inputs to binary
  zeroString = '0000000000000000000'
  oneString = '1111111111111111111'
  zeroStringShort = '00000'
  addressinBinary = "{0:b}".format(address)
  #RTinBinary = "{0:b}".format(RT)
  
  #merge the string
  if address < 0:
    negString = convertToNeg(addressinBinary[1:])
    addressinBinary1 = oneString + negString
  else:
    addressinBinary1 = zeroString + addressinBinary
  #RTinBinary1 = zeroStringShort + RTinBinary
  
  #get the lengths
  numaddress = len(addressinBinary1)
  #numRT = len(RTinBinary1)
   
  #strip them to the correct length
  numaddress1 = numaddress - 19
  #numRT1 = numRT - 5
  addresscorrect = addressinBinary1[numaddress1:]
  #RTcorrect = RTinBinary1[numRT1:]
  
  #combine for full command
  cmd = opcode + '_' + addresscorrect + RT
  
  #write to file
  theFile.write('//' + name + '\n')
  theFile.write(cmd + '\n')
  
def convertToNeg(input):
  #invert the string
  newString = []
  for i in range(0, len(input)):
    if(input[i] == '0'):
      newString.append('1')
    else:
      newString.append('0')
      
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
      
  returnString = ""
  for i in range(0, len(input)):
    returnString = newString[i] + returnString
  #print(returnString)    
  return returnString
      
  
if __name__=='__main__':
    main()   