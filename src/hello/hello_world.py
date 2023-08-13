
import i18n
import numpy as np

mat = np.arange(15).reshape(3, 5)

i18n.add_translation('foo', 'hello world')

print(i18n.t('foo'))
print(mat)
