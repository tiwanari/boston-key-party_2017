#! /usr/bin/ruby

require 'openssl'
require 'prime'


def calc_rsa_d(p,q)
  l = (p - 1).lcm(q - 1)
  e = 65537
  d = (1...l).each { |i| break i if (i > 1 && (e * i) % l == 1) }
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
    puts "p = "+p.to_s
    puts "q1 = "+q1.to_s
    puts "q2 = "+q2.to_s
  end
}

