/*The following rules defines musicians and their instrument*/
musician_instrument('Dang Ngoc Long', 'guitar').
musician_instrument('Ricardo Cobo', 'guitar').
musician_instrument('Julian Byzantine', 'guitar').
musician_instrument('Valerie Muzzolini Gordon', 'harp').
musician_instrument('John Klemmer', 'saxophone').
musician_instrument('Walter Beasley', 'saxophone').

/*The following rules defines musicians and their genre*/
musician_genre('Dang Ngoc Long', 'classical').
musician_genre('Ricardo Cobo', 'classical').
musician_genre('Julian Byzantine', 'classical').
musician_genre('Valerie Muzzolini Gordon', 'classical').
musician_genre('John Klemmer', 'smooth jazz').
musician_genre('Walter Beasley', 'smooth jazz').


/*To query who played the guitar: musician_insturment(Who, 'guitar').*/
