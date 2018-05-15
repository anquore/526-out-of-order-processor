import math


def main():
  
  
  #convert binary to assign statements
  #clear the file
  theFile = open('assigns.txt','w')
  theFile.write("//Starting assigns\n")
  theFile.close()
  
  #open the file to append
  theFile = open('assigns.txt','a')
  
  #open another file for read
  theBinary = open('test01_AddiB.arm', 'r')
  
  #loop over the file
  linesSoFar = 0
  for line in theBinary:
    #determine if it is a comment or not
    if (not(line.startswith("//") or (line == "\n"))):
      striped = line.replace("_", "")
      only32 = striped[0:32]
      
      #create the assign statement
      theAssign = "assign mem[" + str(linesSoFar * 4) + "] = 32'b" + only32 +";" + "\n"
      theFile.write(theAssign)
      
      linesSoFar = linesSoFar + 1
  
  theFile.close()
  theBinary.close()


  
if __name__=='__main__':
    main()   
