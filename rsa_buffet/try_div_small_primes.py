# coding: utf-8
from Crypto.PublicKey import RSA
from primesieve import *

def factory(n):
    ps = generate_n_primes(10000000)
    for p in ps:
        if n % p == 0:
            return p
    return False

if __name__=="__main__":
  for i in range(0,10):
      if i == 3:
          continue

      key_file = "./rsa-buffet/key-" + str(i) + ".pem"
      key = open(key_file).read()

      imported = RSA.importKey(key)
      print "----- key " + str(i) + " -----"
      print "n: " + str(imported.n)

      print factory(imported.n)
