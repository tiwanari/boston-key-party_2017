#! /usr/bin/ruby

require 'openssl'
require 'prime'


def calc_rsa_d(p,q,e=65537)
  lambda = (p-1).lcm(q-1)
  c,a,b = ex_euclid(e,lambda)
  d = a % lambda
end

def ex_euclid(x, y)
  c0, c1 = x, y
  a0, a1 = 1, 0
  b0, b1 = 0, 1
  
  while c1 != 0
    m = c0 % c1
    q = c0 / c1
    
    c0, c1 = c1, m
    a0, a1 = a1, (a0 - q * a1)
    b0, b1 = b1, (b0 - q * b1)
  end
  
  return c0, a0, b0
end

n = []
(0..9).each{|i|
  file = "rsa-buffet/key-"+i.to_s+".pem"
  rsa = OpenSSL::PKey::RSA.new(open(file))
  n.push rsa.n.to_i
}


n.combination(2){|n1,n2|
  if n1.gcd(n2) != 1
    puts "find!"
    p n.index(n1),n.index(n2)
    p = n1.gcd(n2)
    q1 = n1/p
    q2 = n2/p
    d1 = calc_rsa_d(p,q1)
    d2 = calc_rsa_d(p,q2)
    puts "p = "+p.to_s
    puts "q1 = "+q1.to_s
    puts "q2 = "+q2.to_s
    puts ""
    puts "n1 = "+n1.to_s
    puts "d1 = "+d1.to_s
    puts ""
    puts "n2 = "+n2.to_s
    puts "d2 = "+d2.to_s

  end
}

