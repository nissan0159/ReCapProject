﻿using Business.Constants;
using Business.ValidationRules.FluentValidation;
using Core.Aspects.Autofac.Validation;
using Core.Utilities.Results;
using DataAccess;
using Entities;
using Entities.Dtos;
using System.Collections.Generic;
using System.Linq;

namespace Business
{
    public class CarManager : ICarService
    {
        ICarDal _carDal;

        public CarManager(ICarDal carDal)
        {
            _carDal = carDal;
        }

        public IDataResult<List<Car>> GetAll()
        {
            return new SuccessDataResult<List<Car>>(_carDal.GetAll(), Messages.Listed);
        }

        public IDataResult<Car> GetById(int id)
        {
            return new SuccessDataResult<Car>(_carDal.Get(c => c.Id == id), Messages.Listed);
        }

        public IDataResult<List<CarDetailDto>> GetCarDetails()
        {
            return new SuccessDataResult<List<CarDetailDto>>(_carDal.GetAllCarDetails(), Messages.Listed);
        }

        public IDataResult<List<CarDetailDto>> GetCarDetailsById(int id)
        {
            return new SuccessDataResult<List<CarDetailDto>>(_carDal.GetAllCarDetails().Where(c => c.CarId == id).ToList(), Messages.Listed);
        }

        public IDataResult<List<CarDetailDto>> GetCarsByBrandId(int id)
        {
            return new SuccessDataResult<List<CarDetailDto>>(_carDal.GetAllCarDetails().Where(c => c.BrandId == id).ToList(), Messages.Listed);
        }

        public IDataResult<List<CarDetailDto>> GetCarsByColorId(int id)
        {
            return new SuccessDataResult<List<CarDetailDto>>(_carDal.GetAllCarDetails().Where(c => c.ColorId == id).ToList(), Messages.Listed);
        }

        public IDataResult<List<CarDetailDto>> GetCarDetailsByBrandIdAndColorId(int brandId, int colorId)
        {
            return new SuccessDataResult<List<CarDetailDto>>(_carDal.GetAllCarDetails().Where(c => c.BrandId == brandId && c.ColorId == colorId).ToList(), Messages.Listed);
        }

        [ValidationAspect(typeof(CarValidator))]
        public IResult Add(Car car)
        {
            _carDal.Add(car);
            return new SuccessResult(Messages.Added);
        }

        public IResult Update(Car car)
        {
            _carDal.Update(car);
            return new SuccessResult(Messages.Updated);
        }

        public IResult Delete(Car car)
        {
            _carDal.Delete(car);
            return new SuccessResult(Messages.Deleted);
        }


    }
}

