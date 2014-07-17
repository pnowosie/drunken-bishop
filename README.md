# Random ASCII art library for NodeJS

Have you ever connect to server via ssh and seen something like this

```
The key fingerprint is:
18:ff:18:d7:f4:a6:d8:ce:dd:d4:07:0e:e2:c5:f8:45 aaron@kratos
The key's randomart image is:
+--[ RSA 2048]----+
|                 |
|                 |
|      .     . E  |
|       +   = o   |
|      . S + = =  |
|         * * * ..|
|        . + + . +|
|           o . o.|
|            o . .|
+-----------------+
```

That's key art generated to help humans visualy recognize their servers and wouldn't have to verify a 32-character hexadecimal string.

Goal
----
Implement standart OpenSSH' keyart with 9 rows and 17 columns described in [Loss, Limmer and von Gernler paper](http://www.dirk-loss.de/sshvis/drunken_bishop.pdf).
Implement modification of above proposed by [@atoponce](https://github.com/atoponce/keyart) which have chosen a different charset and slighly bigger board (11x19).

More about algorithm you can find in [Aaron Toponce's great article](https://pthree.org/2013/05/30/openssh-keys-and-the-drunken-bishop/).
You are very welcome to contribute (also by improving this text :) 

