import time
def printLyrics():
     lines = [
          "Ohh…" ,
          "Sochu Ke Milni Te Bolanga Ki",
          "Teri Ta Gallan Ch Shayari",
          "Vekhegi Mainu Te Sochegi Kya Tu?",
          "Mitti Da Banda Main ",
          "Tu Ta Pari"
     ] 

     delays = [2.0, 1.6, 1.6, 1.7, 1.2, 0.5]

     for i, line in enumerate(lines):
          for char in line:
               print(char,end='',  flush=True)
               time.sleep(0.07)
          print()
          time.sleep(delays[i])

printLyrics()


