# Network Monitoring Notes

## iftop - Connection-level monitoring
- Shows who is talking to who and how much data
- sudo iftop -t -s 5 (text mode, 5 seconds)
- Use case: find which connection eats bandwidth

## nload - Interface-level monitoring
- Shows total incoming/outgoing traffic as graph
- nload -t 3000 (refresh every 3 sec)
- Use case: see overall network load trend

## Key difference
- iftop = per-connection detail (WHO)
- nload = total bandwidth overview (HOW MUCH)
