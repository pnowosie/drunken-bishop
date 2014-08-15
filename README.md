# Random ASCII art library for NodeJS

Have you ever connect to server via ssh and seen something like this

```
Host key fingerprint is 45:2f:a5:d8:13:95:ba:03:51:c4:8d:ac:82:a8:4c:6a
+--[ RSA 2048]----+
|         ==+o.   |
|        .++=o    |
|   . .  .o*..    |
| .. . . o..o     |
|+.     .S. .     |
|oE        o      |
|.          .     |
|                 |
|                 |
+-----------------+
```

That's key art generated to help humans visualy recognize their servers and wouldn't have to verify a 32-character hexadecimal string.

Implemented
-----------
 * standart OpenSSH' keyart with 9 rows and 17 columns described in [Loss, Limmer and von Gernler paper](http://www.dirk-loss.de/sshvis/drunken_bishop.pdf).
 * modification of above proposed by [@atoponce](https://github.com/atoponce/keyart) which have chosen a different charset and slighly bigger board (11x19).
 * fully configurable board sizes and charsets to eazy create custom visualizations

More about algorithm you can find in [Aaron Toponce's great article](https://pthree.org/2013/05/30/openssh-keys-and-the-drunken-bishop/).
You are very welcome to contribute (also by improving this text :) 

