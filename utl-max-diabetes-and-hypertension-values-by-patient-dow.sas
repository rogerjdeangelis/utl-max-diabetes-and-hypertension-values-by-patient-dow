Max diabetes and hypertension values by patient DOW

github
https://tinyurl.com/y87h8ofe
https://github.com/rogerjdeangelis/utl-max-diabetes-and-hypertension-values-by-patient-dow

SAS Forum
https://tinyurl.com/y7q7wpj9
https://communities.sas.com/t5/Statistical-Procedures/Long-to-wide-format/m-p/641808

*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;

 data have;
      input pt_id diabetes hypertension;
      datalines;
1 0 0
1 1 0
1 1 0
1 0 1
2 0 0
2 0 0
2 0 0
2 0 0
3 1 1
3 0 1
3 0 1
;
run;


Up to 40 obs from HAVE total obs=11

Obs    PT_ID    DIABETES    HYPERTENSION

  1      1          0             0
  2      1          1             0
  3      1          1             0
  4      1          0             0   For patient 1 max diabetes=1 and max hyoertension=0

  5      2          0             0
  6      2          0             0
  7      2          0             0
  8      2          0             0
  9      3          1             1
 10      3          0             1
 11      3          0             1

*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
;

WORK.WANT total obs=3

Obs    PT_ID    _DIABETES    _HYPERTENSION

 1       1          1              0
 2       2          0              0
 3       3          1              1

*
 _ __  _ __ ___   ___ ___  ___ ___
| '_ \| '__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
;

data want;

  do until (last.pt_id);
     set have;
     by pt_id;
     _diabetes     = _diabetes     <> diabetes;
     _hypertension = _hypertension< >h ypertension;
  end;

  output;
  _diabetes=.; _hypertension=.;
  keep _: pt_id;

run;quit;


