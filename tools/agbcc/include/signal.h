#ifndef _SIGNAL_H_
#ifdef __cplusplus
extern "C" {
#endif
#define _SIGNAL_H_

#include "_ansi.h"
#include <sys/signal.h>

typedef int	sig_atomic_t;		/* Atomic entity type (ANSI) */

#define SIG_DFL ((void (*)(int))0)	/* Default action */
#define SIG_IGN ((void (*)(int))1)	/* Ignore action */
#define SIG_ERR ((void (*)(int))-1)	/* Error return */

typedef void (*_sig_func_ptr) (int);

struct _reent;

_sig_func_ptr _EXFUN(_signal_r, (struct _reent *, int, _sig_func_ptr));
int	_EXFUN(_raise_r, (struct _reent *, int));

#ifndef _REENT_ONLY
_sig_func_ptr _EXFUN(signal, (int, _sig_func_ptr));
int	_EXFUN(raise, (int));
#endif

#ifdef __cplusplus
}
#endif
#endif /* _SIGNAL_H_ */
