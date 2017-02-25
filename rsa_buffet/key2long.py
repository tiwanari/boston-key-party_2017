from Crypto.PublicKey import RSA

if __name__=="__main__":
  for i in range(0,10):
      if i == 3:
          continue

      key_file = "./rsa-buffet/key-" + str(i) + ".pem"
      key = open(key_file).read()

      imported = RSA.importKey(key)
      print "----- key " + str(i) + " -----"
      # print "e: " + str(imported.e)
      print "n: " + str(imported.n)
