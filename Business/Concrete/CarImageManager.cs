﻿using Business.Constants;
using Core.Utilities.Business;
using Core.Utilities.FileHelper;
using Core.Utilities.Results;
using DataAccess;
using Entities;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;

namespace Business
{
    public class CarImageManager : ICarImageService
    {
        private ICarImageDal _carImageDal;

        public CarImageManager(ICarImageDal carImageDal)
        {
            _carImageDal = carImageDal;
        }

        public IResult Add(IFormFile file, CarImage carImage)
        {
            IResult result = BusinessRules.Run(CheckIfCarImageLimitExceeded(carImage.CarId));

            if (result != null)
            {
                return result;
            }

            carImage.ImagePath = FileHelper.AddAsync(file);
            carImage.Date = DateTime.Today;
            _carImageDal.Add(carImage);
            return new SuccessResult(Messages.Uploaded);
        }

        public IResult Delete(CarImage carImage)
        {
            var oldPath =
                $@"{Environment.CurrentDirectory}\wwwroot{_carImageDal.Get(c => c.Id == carImage.Id).ImagePath}";
            FileHelper.DeleteAsync(oldPath);

            _carImageDal.Delete(carImage);
            return new SuccessResult(Messages.Deleted);
        }

        public IResult Update(IFormFile file, CarImage carImage)
        {
            var oldPath =
                $@"{Environment.CurrentDirectory}\wwwroot{_carImageDal.Get(c => c.Id == carImage.Id).ImagePath}";
            carImage.ImagePath = FileHelper.UpdateAsync(oldPath, file);

            _carImageDal.Update(carImage);
            return new SuccessResult(Messages.Updated);
        }

        public IDataResult<CarImage> GetImageById(int id)
        {
            return new SuccessDataResult<CarImage>(_carImageDal.Get(p => p.Id == id));
        }

        public IDataResult<List<CarImage>> GetAll()
        {
            return new SuccessDataResult<List<CarImage>>(_carImageDal.GetAll());
        }

        public IDataResult<List<CarImage>> GetImagesByCarId(int carId)
        {
            var result = _carImageDal.GetAll(c => c.CarId == carId);
            if (result.Count == 0)
            {
                var defaultImage = DefaultImage(carId);
                return new SuccessDataResult<List<CarImage>>(defaultImage.Data);
            }

            return new SuccessDataResult<List<CarImage>>(result);

        }

        private IResult CheckIfCarImageLimitExceeded(int carId)
        {
            var result = _carImageDal.GetAll(c => c.CarId == carId).Count;
            if (result >= 5)
            {
                return new ErrorResult(Messages.CarOfImageLimitExceeded);
            }

            return new SuccessResult();
        }

        private IDataResult<List<CarImage>> DefaultImage(int carId)
        {
            List<CarImage> carImages = new List<CarImage>
            {
                new CarImage
                {
                    CarId = carId, ImagePath = (@"\Images\default.png")
                }
            };
            return new SuccessDataResult<List<CarImage>>(carImages);
        }
    }
}