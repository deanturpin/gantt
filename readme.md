```bash
./gantt.sh < tasks.txt 
|----| 1. 1 Sequi esse et occaecati perferendis (5 days)
|     ---------| 2. Rerum laboriosam itaque cupiditate (10 days)
|               | 3. Commodi 2 dolorem quas debitis (1 days)
|                -| 4. Voluptas at repudiandae qui (2 days)
|                  ---| 5. Earum nesciunt (4 days)
|                      ------| 6. Possimus non et 3 (7 days)
|                             -------| 7. Amet (8 days)
|                                     --------| 8. Amet sit (9 days)
|                                              -| 9. Reiciendis (2 days)
|                                                -------| 10. Qui (8 days)

Tasks 10
Weeks 11
Start 01 Feb 2017
Compl 20 Apr 2017
```

The tasks are stored in a plain text file: title followed by a space and a
duration in whole days.
```
Sequi esse et occaecati perferendis 5
Rerum laboriosam itaque cupiditate 10
Commodi dolorem quas debitis 1
Voluptas at repudiandae qui 2
Earum nesciunt 4
Possimus non et 7
Amet 8
Amet sit 9
Reiciendis 2
Qui 8
```
