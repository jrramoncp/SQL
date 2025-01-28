/* EJERCICIOS GRUOP BY*/ 
SELECT * from conquerblocks.contabilidad;
-- 1. Obtener el importe total de ventas de cada departamento.
select departamento, sum(importe) as importe_total
from conquerblocks.contabilidad 
group by departamento; 
-- 2. Obtener el importe total de gastos de cada departamento.
select departamento, sum(importe) as importe from conquerblocks.contabilidad
group by departamento 
having departamento like 'Gastos%';
-- 3. Obtener el número de registros de cada tipo de cuenta contable.
select cuenta_contable, count(cuenta_contable) as numero_de_registros
from conquerblocks.contabilidad 
group by cuenta_contable;
-- 4. Obtener el importe total de ventas de cada mes.
select departamento, sum(importe) as importe_total, month(fecha) as fecha
from conquerblocks.contabilidad
group by departamento, concepto, fecha
having concepto like 'Venta de mercadería';
-- 5. Obtener el importe total de ventas de cada departamento y mes.
select departamento, month(fecha) as mes, sum(importe)
from conquerblocks.contabilidad
group by departamento, mes;
-- 6. Obtener el número de registros de cada tipo de cuenta contable y mes.
select month(fecha) as mes, cuenta_contable, count(cuenta_contable) as total_registros
from conquerblocks.contabilidad
group by cuenta_contable, mes;
-- 7. Obtener el importe total de ventas de cada departamento y mes, ordenado por importe de mayor a menor.
select departamento, month(fecha) as mes, sum(importe) as importe_total
from conquerblocks.contabilidad
group by departamento, mes
order by importe_total desc;
-- 8. Obtener el número de registros de cada tipo de cuenta contable y mes, ordenados por mes de mayor a menor.
select month(fecha) as mes, cuenta_contable, count(cuenta_contable) as total_registros
from conquerblocks.contabilidad
group by cuenta_contable, mes
order by total_registros asc;
